import (
    cli
    os
    json
)

struct LangInstall {
    default string [json:default]
    arch    string
    fedora  string
    ubuntu  string
}

struct Lang {
    ext      string
    name     string
    out_file string [json:outFile]
    cm       string
    rm       string
    tmp      string
    needs    []string
    install  LangInstall
    equal    string
}

struct Langs {
mut:
    m map[string]Lang
}

fn init_langs() Langs {
    languages_str := os.read_file('executor.json') or {
        panic('Failed to load json file')
    }
    languages_arr := json.decode([]Lang, languages_str) or {
        panic('Failed to parse json')
    }

    mut languages := map[string]Lang
    for lang in languages_arr {
        languages[lang.ext] = lang
    }
    return Langs{languages}
}

fn (l Langs) get(ext string) Lang {
    if ext in l.m {
        if l.m[ext].equal != '' {
            return l.m[l.m[ext].equal[1..]]
        } else {
            return l.m[ext]
        }
    } else {
        panic('Unknown language extention `$ext`')
    }
}

fn main() {
    mut cmd := cli.Command{
        name: 'rn',
        description: 'Run everything like a script!',
        version: '1.0.0',
        execute: nothing,
        parent: 0
    }
    cmd.add_flag(cli.Flag{ flag: .string, name: 'compargs',  abbrev: 'c',
                           description: 'Arguments from the compiler'})
    cmd.add_flag(cli.Flag{ flag: .string, name: 'runargs',   abbrev: 'r',
                           description: 'Running arguments'})
    cmd.add_flag(cli.Flag{ flag: .string, name: 'morefiles', abbrev: 'r',
                           description: 'Additional files'})
    cmd.add_flag(cli.Flag{ flag: .int,    name: 'from',      abbrev: 'f',
                           description: 'Lines from'})
    cmd.add_flag(cli.Flag{ flag: .int,    name: 'to',        abbrev: 't',
                           description: 'Lines to'})
    cmd.parse(os.args)
    run(cmd)
}

fn run(cmd cli.Command) {

    home := os.getenv('HOME')
    base := home + '/.cache/runnables'

    if !os.is_dir(base) {
        os.mkdir_all(base)
    }

    languages := init_langs()

    //println(json.encode(languages.get('gs')))
    //println(json.encode(languages))

    fr          := cmd.flags.get_int('from')         or { panic('') }
    to          := cmd.flags.get_int('to')           or { panic('') }
    cm_args     := cmd.flags.get_string('compargs')  or { panic('') }
    rn_args     := cmd.flags.get_string('runargs')   or { panic('') }
    cm_files    := cmd.flags.get_string('morefiles') or { panic('') }

    mut source_file := ''
    mut tmp         := false

    if cmd.args.len > 0 {
        if os.exists(cmd.args[0]) {
            source_file = cmd.args[0]
        } else if cmd.args[0] in languages.m {
            if cmd.args.len > 1 {
                mut src := cmd.args[1]
                for i := 2; i < cmd.args.len; i++ {
                    src += ' ' + cmd.args[i]
                }
                src += '\n'
                tmp = true
                source_file = '$base/Tmp.${cmd.args[0]}'
                os.write_file(source_file, src)
            } else {
                panic('Source needs to be provided as argument')
            }
        } else {
            panic('File `${cmd.args[0]}` not found')
        }
    } else {
        panic('No input provided')
    }

    data := os.read_file(source_file) or {
        panic('Could not read file $source_file')
    }

    println(source_file)
    println(data)

    //println('fr=$fr, to=$to, cm_args=$cm_args, rn_args=$rn_args, args=${cmd.args[0]}')
}

fn nothing(cmd cli.Command) {
}
