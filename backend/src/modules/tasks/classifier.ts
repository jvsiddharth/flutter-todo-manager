const CATEGORY_KEYWORDS = {
  scheduling: ['meeting', 'schedule', 'call', 'appointment', 'deadline'],
  finance: ['payment', 'invoice', 'bill', 'budget', 'expense'],
  technical: ['bug', 'fix', 'error', 'install', 'repair'],
  safety: ['safety', 'hazard', 'inspection', 'ppe']
};

const PRIORITY_KEYWORDS = {
  high: ['urgent', 'asap', 'today', 'immediately', 'critical', 'emergency'],
  medium: ['soon', 'important', 'this week']
};

const ACTION_MAP: Record<string, string[]> = {
  scheduling: ['Block calendar', 'Send invite', 'Prepare agenda', 'Set reminder'],
  finance: ['Check budget', 'Get approval', 'Generate invoice', 'Update records'],
  technical: ['Diagnose issue', 'Assign technician', 'Document fix'],
  safety: ['Conduct inspection', 'Notify supervisor', 'File report'],
  general: []
};

function detectCategory(text: string): string {
  const lower = text.toLowerCase();
  for (const [category, keywords] of Object.entries(CATEGORY_KEYWORDS)) {
    if (keywords.some(k => lower.includes(k))) return category;
  }
  return 'general';
}

function detectPriority(text: string): string {
  const lower = text.toLowerCase();
  for (const [priority, keywords] of Object.entries(PRIORITY_KEYWORDS)) {
    if (keywords.some(k => lower.includes(k))) return priority;
  }
  return 'low';
}

function extractEntities(text: string): string[] {
  const entities = new Set<string>();
  const lower = text.toLowerCase();

  // Date references
  if (/\b(today|tomorrow|\d{4}-\d{2}-\d{2})\b/i.test(text)) {
    entities.add('date_reference');
  }

  // Person names after "with", "by", "assign to"
  const personMatch = text.match(
    /(?:with|by|assign to)\s+([A-Za-z ]+)/i
  );

  if (personMatch) {
    const raw = personMatch[1];

    // Remove trailing date words
    const cleaned = raw
      .replace(/\b(today|tomorrow|asap|soon|immediately)\b/i, '')
      .trim();

    if (cleaned) {
      entities.add(cleaned);
    }
  }

  return Array.from(entities);
}


export function classifyTask(title: string, description: string) {
  const combined = `${title} ${description}`;

  const category = detectCategory(combined);
  const priority = detectPriority(combined);

  return {
    category,
    priority,
    extracted_entities: extractEntities(combined),
    suggested_actions: ACTION_MAP[category] || []
  };
}
