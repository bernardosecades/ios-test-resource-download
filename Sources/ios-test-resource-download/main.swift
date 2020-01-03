import Foundation

do {
  try download()
} catch let error as Error {
  switch error {
  case .missingArgument(let name):
    print("Missing argument: \(name)")
  case .resourceFolderNotFound:
    print("Couldn't find a Resources folder")
  case .downloadFailed(let error):
    print("Download error: \(error)")
  case .failedToWriteToFile(let path):
    print("Couldn't write to the file: \(path)")
  }
  
  exit(1)
} catch {
  print("An unknown error occured: \(error)")
  exit(1)
}
