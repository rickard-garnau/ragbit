import logfire
from fastapi import FastAPI

from backend.data_models import Prompt
from backend.rag import rag_agent

app = FastAPI()

logfire.configure()
logfire.instrument_pydantic_ai()
logfire.instrument_fastapi(app)


@app.post("/rag/query")
async def query_documentation(query: Prompt):  # skickar in en query
    result = await rag_agent.run(query.prompt)  # skickar tillbaka svaret
    return result.output
