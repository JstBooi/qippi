const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const SparkPost = require('sparkpost');

const app = express();
const PORT = 3000;

// Your SparkPost API key
const sparkpost = new SparkPost('894929c81d5c330a1f7d8f26777d670a9dd9c284');

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.post('/send-email', async (req, res) => {
  const { name, subject, toEmail, message } = req.body;

  if (!name || !subject || !toEmail || !message) {
    return res.status(400).json({ error: 'All fields are required' });
  }

  try {
    await sparkpost.transmissions.send({
      content: {
        from: 'kleinbooi.mahlangu@qippi.co.za', // Your verified sending address
        subject: subject,
        html: `<p><strong>${name}</strong> says:</p><p>${message}</p>`,
      },
      recipients: [{ address: toEmail }],
    });

    res.status(200).json({ message: 'Email sent successfully!' });
  } catch (error) {
    console.error('SparkPost Error:', error);
    res.status(500).json({ error: 'Failed to send email' });
  }
});

app.listen(PORT, () => {
  console.log(`🚀 Server running at http://localhost:${PORT}`);
});
