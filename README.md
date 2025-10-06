# helix fork just for me

## my changes
> you can grep for "unruly" and find comments where I made changes
* I modified the keybinds everywhere to use the workman keyboard layout.
* I tweaked what styles were being used for borders, diagnostic messages, and more
* I tweeked some gutter symbols
* I added my own theme lackluster
* I added a function.call zig's highlight.scm
* I added push_jump to lots of commands
* I make some custom commands (seen below)

## custom commands
* `:wa` -> will set **status** to *a* random emote (to visually see that a a write has occured)
* `:rename` -> rename file in place
* `:trash or :delete` -> move file to $trash/trash_(date)_(origional_name)

## issues to keep track of
* [crash highlight on nested errors](https://github.com/helix-editor/helix/issues/13879)
  * the hotfix for this is just to have theme define everything

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
