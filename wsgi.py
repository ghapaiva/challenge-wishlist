if __name__ in ['__main__', "wsgi"]:
    from lib.app import create_app

    app = create_app()
