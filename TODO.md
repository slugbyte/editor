# slugbytes dev notes

## TODO
* a picker to grep_sub_dir
* a picker to spellcheck
* [add picker to search_buffer](https://github.com/helix-editor/helix/pull/13053/files)
* [add :index command](https://github.com/helix-editor/helix/pull/13354)

## thinks i think should be fixed in upstream
### fix what highlights are buing used 
 * picker/menu/prompt/other-component keybinds should be adjustable with the config
 * picker borders should use ui.window (its allways white no matter what right now)
 * diagnostics status and inline should allways use diagnostic.* not just (info/error/warning/hint)
 * gutter symbols should be configureable in the config
 * function call querys should be added to all the highlight.scm files [function query enhancement]
 * i wish that (till/find)_(next/prev)_char fns could be configured to never leave the current line
 * i wish that (till/find)_(next/prev)_char would auto add to jumplist

### function query enhancement
I think function qureys should be given a optional `.call` extension. This would allow theme designers to
configure decleration and call/invocation seperatly. Adding `.call` would not break exiting themes, it would
only give theme designers more controll.

`function` - function decleration or call
`function.call` - function call overwrite
`function.method` - method decleration or call
`function.method.call` - method call overwrite
`function.builtin` - builting call (builtins cannot be defined)

## issues to keep track of
* [crash slice out of range i left backtrace on](https://github.com/helix-editor/helix/issues/13325)
* [crash slice out of range](https://github.com/helix-editor/helix/issues/10497)
* [crash highlight on nested errors](https://github.com/helix-editor/helix/issues/13879)
  * the hotfix for this is just to have theme define everything
