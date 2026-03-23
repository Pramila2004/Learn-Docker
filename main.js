import express from 'express';

const app = express();
const PORT = process.env.PORT || 8000;

app.get('/', (req, res) => {
    return res.json({ message: 'Hello from application' });
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});