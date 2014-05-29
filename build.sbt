name := "LiveFeed"

version := "1.0-SNAPSHOT"

libraryDependencies ++= Seq(
  javaJdbc,
  javaEbean,
  cache,
  jdbc,
  "org.hibernate" % "hibernate-entitymanager" % "3.6.9.Final",
  "mysql" % "mysql-connector-java" % "5.1.27"
)     


play.Project.playJavaSettings
