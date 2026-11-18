from pathlib import Path

DATA_PATH = Path(__file__).parents[1] / "data"
VECTOR_DATABASE_PATH = Path(__file__).parents[1] / "knowledge_base"

if __name__ == "__main__":
    print(DATA_PATH)
