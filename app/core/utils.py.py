from datetime import datetime


def to_zulu(_datetime: datetime = datetime.now()) -> str:
    return _datetime.strftime("%Y-%m-%dT%H:%M:%S.%f")[:-3] + "Z"
