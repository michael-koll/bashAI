# bashAI
- Command line tool to use AI directly in your terminal.
- Simply pipe your input in bashAI and add your prompt.

# Requirements
- jq - https://jqlang.github.io/jq/download/
- Gemini API Key - https://ai.google.dev/gemini-api/docs/api-key

# Installation

1. Download the script
2. Replace `API_KEY` with your own API key
4. Give the file execute permissions:
   ```
   chmod +x bashAI.sh
   ```
5. Setup an Alias
   ```
   alias ai='~/YOUR_PATH/bashAI.sh' 
   ```
6.(Adapt the `PROMPT` to fit your tasks) 
# Usage
```
<input> | ai <question>
```
# Examples
Add context to your research:

![image](https://github.com/user-attachments/assets/90f7e853-7cda-4395-8da2-39698cdaacb0)
Filter your data:

![image](https://github.com/user-attachments/assets/a04c243a-2703-4bfc-b0ec-7e0b1a55b7a2)
