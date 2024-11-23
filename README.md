# PDF Converter Application

A web application that converts DOCX files to PDF format. Built with React (Vite) frontend and Node.js backend.

## Prerequisites

Before you begin, ensure you have the following installed:
- [Node.js](https://nodejs.org/) (v18 or higher)
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Git](https://git-scm.com/downloads)

## Project Structure
```
PDF-Converter-main/
├── backend/
│   ├── files/           # Converted PDF files directory
│   ├── uploads/         # Uploaded DOCX files directory
│   ├── index.js         # Main server file
│   └── package.json     # Backend dependencies
├── frontend/
│   ├── src/            # React source files
│   └── package.json    # Frontend dependencies
├── .dockerignore
├── docker-compose.yml
├── Dockerfile
└── README.md
```

## Quick Start (Docker)

1. Clone the repository:
```bash
git clone <repository-url>
cd PDF-Converter-main
```

2. Create necessary directories:
```bash
mkdir -p backend/files backend/uploads
```

3. Run with Docker Compose:
```bash
docker compose up --build
```

## Manual Setup (Development)

### Backend Setup

1. Navigate to backend directory:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Create required directories:
```bash
mkdir -p files uploads
```

4. Start the backend server:
```bash
npm start
```

The backend server will run on http://localhost:3000

### Frontend Setup

1. Open a new terminal and navigate to frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm run dev
```

The frontend development server will run on http://localhost:5173

## Using the Application

1. Open your browser and go to http://localhost:3000 (Docker) or http://localhost:5173 (Development)
2. Click on the upload button to select a DOCX file
3. Upload the file
4. The converted PDF will be automatically downloaded

## Common Issues & Troubleshooting

### Docker Issues

1. Port already in use:
```bash
# Stop any running containers
docker compose down

# Check if any process is using port 3000
lsof -i :3000
# Kill the process if needed
kill -9 <PID>
```

2. Permission issues with uploads/files directories:
```bash
# Fix permissions
sudo chown -R $USER:$USER backend/uploads backend/files
chmod 755 backend/uploads backend/files
```

### Application Issues

1. File upload fails:
- Check if the uploads directory exists and has proper permissions
- Ensure the file is a valid DOCX file
- Check backend logs for specific errors

2. PDF conversion fails:
- Ensure LibreOffice is installed (installed automatically in Docker)
- Check if the files directory exists and has proper permissions
- Check backend logs for conversion errors

## Development Commands

### Docker Commands
```bash
# Build and start containers
docker compose up --build

# Start in background
docker compose up -d

# Stop containers
docker compose down

# View logs
docker compose logs -f
```

### NPM Commands
```bash
# Frontend development server
cd frontend
npm run dev

# Backend development server
cd backend
npm start
```

## Environment Variables

Default values are set, but you can override them by creating a `.env` file:

```env
# Backend
PORT=3000

# Frontend (if running in development)
VITE_API_URL=http://localhost:3000
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.