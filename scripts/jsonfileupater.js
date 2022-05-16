import { createRequire } from "module";
import { fileURLToPath } from "url";
const require = createRequire(import.meta.url);
const fs = require("fs");

for (var i = 1; i <= 5555; i++) {
  const fileName = `./${i}.json`;
  const file = require(fileName);
  file.description =
    "Due to the rapid development of technology and gene modification, technology developed to hack into the genome of living beings by the massive amount of data spread around. The hacking of genome, makes it possible to apply genetic modifications at will. Join our community to develop an HCHB antivirus using artificial intelligence and gene therapy. Visit us on metatigersclub.com, MTC Token Coming Soon.";
  file.external_url = "https://metatigersclub.com/";
  file.properties.files[0].uri = `${i}.png`;
  file.image = `${i}.png`;
  fs.writeFile(fileName, JSON.stringify(file), function writeJSON(err) {
    if (err) return console.log(err);
    console.log(JSON.stringify(file));
    console.log("writing to" + fileName);
  });
}
