import Foundation
import Files

enum Error: Swift.Error {
  case missingArgument(name: String)
  case resourceFolderNotFound
  case downloadFailed(Swift.Error)
  case failedToWriteToFile(path: String)
}

private func resolveArguments() throws -> (url: URL, fileName: String) {
  let container = UserDefaults.standard
  
  guard let urlString = container.string(forKey: "url"),
    let url = URL(string: urlString) else {
      throw Error.missingArgument(name: "url")
  }
  
  guard let fileName = container.string(forKey: "file") else {
    throw Error.missingArgument(name: "file")
  }
  
  return (url, fileName)
}

private func findResourcesFolder() throws -> Folder {
  let thisFile = try File(path: "\(#file)")
  let parent = thisFile.parent
  
  guard let rootFolder = parent else {
    throw Error.resourceFolderNotFound
  }
  
  do {
    return try rootFolder.createSubfolderIfNeeded(at: "Resources")
  } catch {
    throw Error.resourceFolderNotFound
  }
}

private func downloadData(from url: URL) throws -> Data {
  do { return try Data(contentsOf: url) }
  catch { throw Error.downloadFailed(error) }
}

private func shouldDownloadFile(named fileName: String,
                                into folder: Folder) -> Bool {
  // We also add support for passing a '-force' argument on
  // the command line, which will trigger a download regardless
  // of how much time that has passed since the last one:
  guard !CommandLine.arguments.contains("-force") else {
    return true
  }
  
  guard let file = try? folder.file(named: fileName),
    let modificationDate = file.modificationDate else {
      return true
  }
  
  // Make sure that approximately 24 hours have passed:
  let threshold: TimeInterval = 24 * 60 * 60
  return modificationDate.timeIntervalSinceNow > threshold
}

func download() throws {
  let arguments = try resolveArguments()
  let folder = try findResourcesFolder()
  
  guard shouldDownloadFile(named: arguments.fileName, into: folder) else {
    return
  }
  
  let data = try downloadData(from: arguments.url)
  
  do {
    let file = try folder.createFileIfNeeded(withName: arguments.fileName)
    try file.write(data)
  } catch {
    let path = folder.path + arguments.fileName
    throw Error.failedToWriteToFile(path: path)
  }
}
