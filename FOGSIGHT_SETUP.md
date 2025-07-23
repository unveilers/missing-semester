# Fogsight AI Animation System Setup

This document explains how to set up and run the Fogsight AI Animation System integrated with the Missing Semester website.

## Prerequisites

1. **Python 3.9+** - Required for the Fogsight backend
2. **Ruby and Jekyll** - Required for the Missing Semester website
3. **AI API Key** - Required for Fogsight to generate animations

## Directory Structure

Ensure your directory structure looks like this:
```
parent-directory/
├── fogsight/          # Fogsight AI backend
└── missing-semester/  # Jekyll website with integrated Fogsight interface
```

## Installation Steps

### 1. Install Fogsight Dependencies

Navigate to the fogsight directory and install Python dependencies:
```bash
cd fogsight
pip install -r requirements.txt
```

### 2. Configure API Credentials

Edit `fogsight/credentials.json` with your AI service credentials:
```json
{
    "API_KEY": "your-actual-api-key-here",
    "BASE_URL": "https://api.openai.com/v1",
    "MODEL": "gpt-3.5-turbo"
}
```

Supported AI services:
- **OpenAI**: Use `https://api.openai.com/v1` as BASE_URL
- **Google Gemini**: Use appropriate Gemini API endpoint
- **OpenRouter**: Use `https://openrouter.ai/api/v1` as BASE_URL

### 3. Install Jekyll Dependencies

Navigate to the missing-semester directory and install Jekyll:
```bash
cd missing-semester
bundle install
```

## Running the System

### Option 1: Automated Startup (Recommended)

Use the provided startup script to launch both services:
```bash
cd missing-semester
./start-fogsight-system.sh
```

This will start:
- Fogsight backend on `http://localhost:8000`
- Jekyll frontend on `http://localhost:4000`
- Fogsight interface available at `http://localhost:4000/fogsight/`

### Option 2: Manual Startup

Start each service separately:

**Terminal 1 - Fogsight Backend:**
```bash
cd fogsight
python start_fogsight.py
```

**Terminal 2 - Jekyll Frontend:**
```bash
cd missing-semester
bundle exec jekyll serve --host 0.0.0.0 --port 4000
```

## Usage

1. Open your browser and navigate to `http://localhost:4000/fogsight/`
2. Enter a concept or topic you want to animate (e.g., "黑洞是如何形成的", "冒泡排序")
3. Wait for the AI to generate the animation code
4. View the generated animation in the embedded player
5. Use the action buttons to:
   - Open animation in new window
   - Save as HTML file
   - Export as video (coming soon)

## Features

- **Bilingual Interface**: Switch between Chinese and English
- **Real-time Generation**: Stream animation code generation
- **Interactive Player**: View animations directly in the browser
- **Export Options**: Save animations as HTML files
- **Responsive Design**: Works on desktop and mobile devices

## Troubleshooting

### Backend Service Issues
- Ensure Python dependencies are installed: `pip install -r requirements.txt`
- Check that port 8000 is not in use by another service
- Verify API credentials are correctly configured

### Frontend Issues
- Ensure Jekyll is installed: `bundle install`
- Check that port 4000 is available
- Verify static assets are properly copied to `/static/fogsight/`

### API Connection Issues
- Verify your API key is valid and has sufficient credits
- Check network connectivity to the AI service
- Ensure the BASE_URL matches your AI service provider

### Common Error Messages
- **"Fogsight服务不可用"**: Backend service is not running on port 8000
- **"今天已经使用太多"**: API rate limit exceeded, try again later
- **Connection refused**: Check if both services are running

## Development

The integration consists of:
- **Backend**: Fogsight FastAPI service (`fogsight/app.py`)
- **Frontend**: Jekyll page with custom CSS/JS (`missing-semester/fogsight.md`)
- **Assets**: Copied from fogsight to Jekyll static directory
- **Navigation**: Added to Jekyll site navigation

To modify the interface:
1. Edit `fogsight.md` for HTML structure
2. Edit `static/fogsight/style.css` for styling
3. Edit `static/fogsight/script.js` for functionality

## Security Notes

- Never commit real API keys to version control
- Use environment variables for production deployments
- The current setup is for development/demo purposes only
- For production, consider using HTTPS and proper authentication
