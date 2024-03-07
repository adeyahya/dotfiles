import { $ } from "bun"
import os from "os"
import fs from "fs/promises"
import path from "path"

// run install.txt
const f = Bun.file(path.resolve(__dirname, "install.txt"));
const scripts = (await f.text()).split(/\n/g).filter(n => !n.startsWith("#"));
for (const inst of scripts) {
  const cmds = inst.split(/\s/g).filter(n => !!n);
  if (cmds.length === 0) continue;
  const proc = Bun.spawn(cmds);
  const output = await new Response(proc.stdout).text();
  console.log(output)
}

// symlink all dotfiles
const files = await fs.readdir(__dirname);
const dotFiles = files.filter(n => n.startsWith(".") || n == ".git")
for (const fpath of dotFiles) {
  const stats = await fs.stat(path.resolve(__dirname, fpath));
  const target = path.resolve(os.homedir(), fpath);
  const source = path.resolve(path.resolve(__dirname, fpath))
  if (stats.isDirectory()) {
    await $`rm -rf ${target}`;
    await $`ln -s ${source} ${target}`;
  } else if (stats.isFile()) {
    await $`rm ${target}`;
    await $`ln -s ${source} ${target}`;
  }
  console.log(`symlinked ${target}`)
}
