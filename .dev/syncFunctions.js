const fs = require('fs');
const path = require('path');

// Function to recursively get all .sqf files in a directory
function getSqfFiles(dir) {
  const files = [];
  const items = fs.readdirSync(dir, { withFileTypes: true });

  for (const item of items) {
    const fullPath = path.join(dir, item.name);

    if (item.isDirectory()) {
      // Recursively scan subdirectories
      files.push(...getSqfFiles(fullPath));
    } else if (item.isFile() && path.extname(item.name) === '.sqf') {
      // Add .sqf files
      files.push(fullPath);
    }
  }

  return files;
}

// Function to get all mission directories
function getMissionDirectories(dir) {
  const directories = [];
  const items = fs.readdirSync(dir, { withFileTypes: true });

  for (const item of items) {
    if (item.isDirectory()) {
      directories.push(path.join(dir, item.name));
    }
  }

  return directories;
}

// Main function
function main() {
  try {
    const sharedFunctionsDir = 'shared/functions';
    const missionsDir = 'missions';

    // Check if directories exist
    if (!fs.existsSync(sharedFunctionsDir)) {
      console.error(`Directory ${sharedFunctionsDir} does not exist`);
      return;
    }

    if (!fs.existsSync(missionsDir)) {
      console.error(`Directory ${missionsDir} does not exist`);
      return;
    }

    // Get all .sqf files
    const sqfFiles = getSqfFiles(sharedFunctionsDir);
    console.log(`Found ${sqfFiles.length} .sqf files in ${sharedFunctionsDir}`);

    // Get all mission directories
    const missionDirs = getMissionDirectories(missionsDir);
    console.log(`Found ${missionDirs.length} mission directories`);

    // Process each .sqf file
    for (const sqfFile of sqfFiles) {
      // Get just the filename (not the full path)
      const fileName = path.basename(sqfFile);

      // Get the relative path from shared/functions to the file
      const relativePath = path.relative(sharedFunctionsDir, sqfFile);

      console.log(`Processing ${relativePath}...`);

      // For each mission directory, create the corresponding file
      for (const missionDir of missionDirs) {
        if (missionDir.includes('~')) {
          return; // Skip any mission directories that contain a tilde (~)1
        }
        // Target file is directly in the mission directory with the same name
        const targetFile = path.join(missionDir, 'functions', fileName);

        // Create the file with the include line
        // Using backslashes for the include path in case this is for Windows
        const includeStatement = `#include "..\\..\\..\\shared\\functions\\${relativePath.replace(
          /\//g,
          '\\'
        )}"\n`;
        fs.writeFileSync(targetFile, includeStatement);

        console.log(`  Created ${targetFile}`);
      }
    }

    console.log('Done!');
  } catch (error) {
    console.error('Error:', error);
  }
}

// Run the script
main();
