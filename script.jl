import JSON
import Combinatorics

dirs = readdir("input")

function combine_modnames(modnames, div)
    output = ""
    for name in modnames
        output = "$output$div$name"
    end
    output[(length(div)+1):end]
end

struct ModMeta
    abbrev::String
    name::String
    priority::Int
    unit_list::Set{String}
    comm_list::Set{String}
end

mods = Vector{ModMeta}()

for dir_end in dirs
    dir = joinpath("input", dir_end)
    if !isdir(dir)
        continue
    end

    metafile = joinpath(dir, "meta.json")
    if !isfile(metafile)
        println("meta.json not found in ", dir)
        continue
    end
    meta = JSON.parsefile(metafile)
    req_fields = ["name", "priority"]
    for field in req_fields
        if !(field in keys(meta))
            println("meta.json is missing \"$field\" field")
        end
    end
    unit_list_path = joinpath(dir, "unit_list.json")
    comm_list_path = joinpath(dir, "commander_list.json")

    abbrev = dir_end
    name = meta["name"]
    priority = meta["priority"]
    unit_list = Set{String}(
        if isfile(unit_list_path)
            JSON.parsefile(unit_list_path)["units"]
        else
            []
        end
    )
    comm_list = Set{String}(
        if isfile(comm_list_path)
            JSON.parsefile(comm_list_path)["commanders"]
        else
            []
        end
    )

    push!(mods, ModMeta(
        abbrev,
        name,
        priority,
        unit_list,
        comm_list
    ))
end

for combo in Combinatorics.powerset(mods, 2)
    abbrevs = getproperty.(combo, :abbrev)

    filename = "compatch_$(combine_modnames(abbrevs, "+"))"
    folder = joinpath("output", filename)
    mkpath(folder)

    modinfo = JSON.parsefile("modinfo_template.json")
    modinfo["display_name"] = "DAEDALUS ComPatch - $(combine_modnames(abbrevs, " + "))"
    modinfo["identifier"] = "com.pa.daedalus.compatch_$(combine_modnames(abbrevs, "-"))"
    modinfo["description"] = "Compatibility Patch for the following unit-adding mods: $(abbrevs...)"
    modinfo["priority"] = minimum(getproperty.(combo, :priority)) - 1
    write(joinpath(folder, "modinfo.json"), JSON.json(modinfo))

    unit_lists = getproperty.(combo, :unit_list)
    if sum([!isempty(i) for i in unit_lists]) > 1
        new_unit_list = Dict("units" => collect(union(unit_lists...)))
        unit_path = joinpath(folder, "pa/units")
        mkpath(unit_path)
        write(joinpath(unit_path, "unit_list.json"), JSON.json(new_unit_list))
    end

    comm_lists = getproperty.(combo, :comm_list)
    if sum([!isempty(i) for i in comm_lists]) > 1
        new_comm_list = Dict("commanders" => collect(union(comm_lists...)))
        comm_path = joinpath(folder, "pa/units/commanders")
        mkpath(comm_path)
        write(joinpath(comm_path, "unit_list.json"), JSON.json(new_comm_list))
    end
end