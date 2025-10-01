# Create new Maven project
```sh
mvn -B archetype:generate \
 -DarchetypeGroupId=software.amazon.awssdk \
 -DarchetypeArtifactId=archetype-lambda \
 -DarchetypeVersion=2.20.0 \
 -Dservice=s3 \
 -Dregion=us-west-2 \
 -DgroupId=com.example.myapp \
 -DartifactId=myapp  
```