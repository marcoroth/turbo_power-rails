import resolve from "@rollup/plugin-node-resolve"
import { terser } from "rollup-plugin-terser"
import packageInfo from "./package.json"

const minify = () => {
  return terser({
    mangle: true,
    compress: true
  })
}

const pretty = () => {
  return terser({
    mangle: false,
    compress: false,
    format: {
      beautify: true,
      indent_level: 2
    }
  })
}

const output = [
  {
    file: packageInfo.main,
    format: "es",
    inlineDynamicImports: true,
    plugins: [pretty()]
  },
  {
    file: "app/assets/javascripts/turbo_power.min.js",
    format: "es",
    inlineDynamicImports: true,
    sourcemap: true,
    plugins: [minify()]
  }
]

export default [
  {
    external: ["@hotwired/turbo"],
    input: packageInfo.module,
    output,
    plugins: [resolve()]
  }
]
