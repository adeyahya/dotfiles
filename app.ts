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

const checkExist = async (p: string) => {
  try {
    const stat = await fs.stat(p);
    return stat
  } catch (_) {
    return null
  }
}

const walker = async (sp: string, tp: string): Promise<any> => {
  const sstat = await fs.stat(sp)
  const tstat = await checkExist(tp)
  if (!tstat && sstat.isDirectory()) {
    await $`mkdir -p ${tstat}`
  }

  if (sstat.isDirectory()) {
    const dirs = await fs.readdir(sp)
    for (const d of dirs) {
      await walker(path.join(sp, d), path.join(tp, d))
    }
    return;
  }

  // if file exist
  if (tstat && tstat.isFile()) await $`rm ${tp}`
  if (tstat && tstat.isDirectory()) await $`rm -rf ${tp}`

  if (sstat.isFile()) {
    await $`ln -s ${sp} ${tp}`;
  }
  console.log(`symlinked ${tp}`)
}

// symlink all dotfiles
const files = await fs.readdir(__dirname);
const dotFiles = files.filter(n => n.startsWith(".") && n !== ".git" && n !== ".gitignore")
for (const fpath of dotFiles) {
  const target = path.resolve(os.homedir(), fpath);
  const source = path.resolve(path.resolve(__dirname, fpath))
  await walker(source, target)
}
