#Requires AutoHotkey v2.0
;;
;; An autohotkey script that provides emacs-like keybinding on Windows
;;

InstallKeybdHook
;; Disable delay
SetControlDelay 0
;; Disable key delay
SetKeyDelay -1
;; Disable window delay
SetWinDelay 0
;; Disable log
ListLines 0

SendMode "Input"

reset_pre_keys() {
  global
  ;; turns to be 1 when ctrl-x is pressed
  is_pre_x := 0
  ;; turns to be 1 when ctrl-space is pressed
  is_pre_spc := 0
}

set_ignore_targets() {
  ;; Applications to disable emacs-like keybindings
  GroupAdd "IgnoreTargets", "ahk_exe rlogin.exe"
  GroupAdd "IgnoreTargets", "ahk_exe ttermpro.exe"
  GroupAdd "IgnoreTargets", "ahk_exe firefox.exe"
  GroupAdd "IgnoreTargets", "ahk_exe Code.exe"
  GroupAdd "IgnoreTargets", "ahk_exe WindowsTerminal.exe"
}

reset_pre_keys()
set_ignore_targets()

delete_char() {
  Send "{Del}"
  reset_pre_keys()
  Return
}

delete_backward_char() {
  Send "{BS}"
  reset_pre_keys()
  Return
}

kill_line() {
  Send "{ShiftDown}{END}{ShiftUp}"
  Sleep 50 ;[ms] this value depends on your environment
  Send "^x"
  reset_pre_keys()
  Return
}

open_line() {
  Send "{END}{Enter}{Up}"
  reset_pre_keys()
  Return
}

quit() {
  Send "{ESC}"
  reset_pre_keys()
  Return
}

newline() {
  Send "{Enter}"
  reset_pre_keys()
  Return
}

indent_for_tab_command() {
  Send "{Tab}"
  reset_pre_keys()
  Return
}

newline_and_indent() {
  Send "{Enter}{Tab}"
  reset_pre_keys()
  Return
}

isearch_forward() {
  Send "^f"
  reset_pre_keys()
  Return
}

isearch_backward() {
  Send "^f"
  reset_pre_keys()
  Return
}

kill_region() {
  Send "^x"
  reset_pre_keys()
  Return
}

kill_ring_save() {
  Send "^c"
  reset_pre_keys()
  Return
}

yank() {
  Send "^v"
  reset_pre_keys()
  Return
}

undo() {
  Send "^z"
  reset_pre_keys()
  Return
}

find_file() {
  Send "^o"
  reset_pre_keys()
  Return
}

save_buffer() {
  Send "^s"
  reset_pre_keys()
  Return
}

kill_window() {
  Send "!{F4}"
  reset_pre_keys()
  Return
}

kill_buffer() {
  Send "^w"
  reset_pre_keys()
  Return
}

move_beginning_of_line() {
  global
  if is_pre_spc
    Send "+{HOME}"
  Else {
    Send "{HOME}"
    reset_pre_keys()
  }
  Return
}

move_end_of_line() {
  global
  if is_pre_spc
    Send "+{END}"
  Else {
    Send "{END}"
    reset_pre_keys()
  }
  Return
}

previous_line() {
  global
  if is_pre_spc
    Send "+{Up}"
  Else {
    Send "{Up}"
    reset_pre_keys()
  }
  Return
}

next_line() {
  global
  if is_pre_spc
    Send "+{Down}"
  Else {
    Send "{Down}"
    reset_pre_keys()
  }
  Return
}

forward_char() {
  global
  if is_pre_spc
    Send "+{Right}"
  Else {
    Send "{Right}"
    reset_pre_keys()
  }
  Return
}

backward_char() {
  global
  if is_pre_spc
    Send "+{Left}"
  Else {
    Send "{Left}"
    reset_pre_keys()
  }
  Return
}

scroll_up() {
  global
  if is_pre_spc
    Send "+{PgUp}"
  Else {
    Send "{PgUp}"
    reset_pre_keys()
  }
  Return
}

scroll_down() {
  global
  if is_pre_spc
    Send "+{PgDn}"
  Else {
    Send "{PgDn}"
    reset_pre_keys()
  }
  Return
}

pageup_top()
{
  global
  If is_pre_spc
    Send "+^{Home}"
  Else {
    Send "^{Home}"
    reset_pre_keys()
  }
  Return
}

pagedown_bottom()
{
  global
  If is_pre_spc
    Send "+^{End}"
  Else {
    Send "^{End}"
    reset_pre_keys()
  }
  Return
}

#HotIf not WinActive("ahk_group IgnoreTargets")

^x::global is_pre_x := "1"
;;^{Space}::global is_pre_spc := "1"
^vk20::
{
  global
  If is_pre_spc
    is_pre_spc := 0
  Else
    is_pre_spc := 1
  Return
}

^f::
{
  global
  If is_pre_x
    find_file()
  Else
    forward_char()
  Return
}

;; ^c::
;; {
;;   global
;;   If is_pre_x
;;      kill_window()
;;   Return
;; }

^d::delete_char()
^h::delete_backward_char()
^k::kill_line()

k::
{
  global
  If is_pre_x
    kill_buffer()
  Else
    Send A_ThisHotkey
  Return
}

^o::open_line()
^g::quit()
^j::newline_and_indent()
^m::newline()
^i::indent_for_tab_command()

^s::
{
  global
  If is_pre_x
    save_buffer()
  Else
    isearch_forward()
  Return
}

^r::isearch_backward()
^w::kill_region()
!w::kill_ring_save()

^y::yank()
^/::undo()

^@::
{
  global
  If is_pre_spc
    is_pre_spc := "0"
  Else
    is_pre_spc := "1"
  Return
}

^a::move_beginning_of_line()
^e::move_end_of_line()
^p::previous_line()
^n::next_line()
^b::backward_char()
;; ^v::scroll_down()
!v::scroll_up()
!<::pageup_top()
!>::pagedown_bottom()

;;
;; Unix-like keybindings
;;
^[::Send "{Esc}"
