# Step 1: Commit analysis files

system("git add analysis/about.Rmd")
system("git add analysis/index.Rmd")
system("git add analysis/license.Rmd")
system("git add analysis/01-batch-integration.Rmd")
system("git add analysis/02-reduced-dimensions.Rmd")
system("git add analysis/03-clustering.Rmd")
system("git add analysis/04-marker-detection.Rmd")
system("git add analysis/mouse-integration.Rmd")
system("git add analysis/mouse-trajectory-endothelium.Rmd")
system("git add analysis/mouse-pseudotime-endothelium.Rmd")
system("git add analysis/mouse-ontology-endothelium.Rmd")
system("git add analysis/mouse-trajectory-cardiomyocytes.Rmd")
system("git add analysis/mouse-pseudotime-cardiomyocytes.Rmd")
system("git add analysis/mouse-ontology-cardiomyocytes.Rmd")
system("git commit -m 'Build'")

# Step 2: Build HTML files

wflow_build("analysis/about.Rmd")
wflow_build("analysis/index.Rmd")
wflow_build("analysis/license.Rmd")
wflow_build("analysis/01-batch-integration.Rmd")
wflow_build("analysis/02-reduced-dimensions.Rmd")
wflow_build("analysis/03-clustering.Rmd")
wflow_build("analysis/04-marker-detection.Rmd")
wflow_build("analysis/mouse-integration.Rmd")
wflow_build("analysis/mouse-trajectory-endothelium.Rmd")
wflow_build("analysis/mouse-pseudotime-endothelium.Rmd")
wflow_build("analysis/mouse-ontology-endothelium.Rmd")
wflow_build("analysis/mouse-trajectory-cardiomyocytes.Rmd")
wflow_build("analysis/mouse-pseudotime-cardiomyocytes.Rmd")
wflow_build("analysis/mouse-ontology-cardiomyocytes.Rmd")

# Step 3: Commit HTML files

system("git add docs/about.html")
system("git add docs/index.html")
system("git add docs/license.html")
system("git add docs/01-batch-integration.html")
system("git add docs/02-reduced-dimensions.html")
system("git add docs/03-clustering.html")
system("git add docs/04-marker-detection.html")
system("git add docs/mouse-integration.html")
system("git add docs/mouse-trajectory-endothelium.html")
system("git add docs/mouse-pseudotime-endothelium.html")
system("git add docs/mouse-ontology-endothelium.html")
system("git add docs/mouse-trajectory-cardiomyocytes.html")
system("git add docs/mouse-pseudotime-cardiomyocytes.html")
system("git add docs/mouse-ontology-cardiomyocytes.html")
system("git commit -m 'Build'")

# Step 4: Commit PNG files

system("git add docs/figure/01-batch-integration.Rmd")
system("git add docs/figure/02-reduced-dimensions.Rmd")
system("git add docs/figure/03-clustering.Rmd")
system("git add docs/figure/04-marker-detection.Rmd")
system("git add docs/figure/mouse-integration.Rmd")
system("git add docs/figure/mouse-trajectory-endothelium.Rmd")
system("git add docs/figure/mouse-pseudotime-endothelium.Rmd")
system("git add docs/figure/mouse-ontology-endothelium.Rmd")
system("git add docs/figure/mouse-trajectory-cardiomyocytes.Rmd")
system("git add docs/figure/mouse-pseudotime-cardiomyocytes.Rmd")
system("git add docs/figure/mouse-ontology-cardiomyocytes.Rmd")
system("git commit -m 'Build'")

# Step 5: Commit docs files

system("git add docs/site_libs")
system("git add docs/.nojekyll")
system("git commit -m 'Build'")

# Step 6: Push to master

system("git push origin master")
