if vim.fn.has("unix") == 1 then
	local uname = vim.system({ "echo", "-n", '"$(uname)"' }, { text = true }):wait()
	if uname.code == 0 and uname.stdout == "Linux" then
		vim.g.sysop = "linux"
	elseif uname.stdout == "Darwin\n" then
		vim.g.sysop = "mac"
	else
		vim.g.sysop = "unix"
	end
elseif vim.fn.has("win32") or vim.fn.has("win64") then
	vim.g.sysop = "win"
else
	vim.g.sysop = "undefined"
end

vim.opt.shell = vim.g.sysop == "win" and "pwsh" or "fish"
if vim.g.sysop == "win" then
	vim.opt.shellxquote = ""
	vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
	vim.opt.shellquote = ""
	vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
	vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"
end
