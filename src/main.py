# main.py
import sys
import Search
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
import UI.resources_rc

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    backend = Search.search()
    engine.rootContext().setContextProperty("backend", backend)
    engine.addImportPath(sys.path[0])
    engine.loadFromModule("UI", "Main")
    if not engine.rootObjects():
        sys.exit(-1)
    exit_code = app.exec()
    del engine
    sys.exit(exit_code)