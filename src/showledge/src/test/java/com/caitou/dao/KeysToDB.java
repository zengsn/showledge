package com.caitou.dao;

/*
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration({"classpath:applicationContext.xml"})*/
public class KeysToDB {
/*
	@Autowired
	private KeysDao keysDao;
	
	*//**
	 * 关键词去重
	 * @throws IOException 
	 *//*
	@Test
	public void toDb() throws IOException{
		
		InputStream resourceAsStream = KeysToDB.class.getClassLoader().getResourceAsStream("THUOCL_it.txt");
		
		List<String> readLines = IOUtils.readLines(resourceAsStream);
		System.out.println(readLines.size());
		
		int num = 0;
		for (String string : readLines) {
			try {
				String[] split = string.split(" 	 ");
				String key = split[0];
				int count = Integer.valueOf(split[1]);
				Key k = new Key(key, count);
				int insert = keysDao.insert(k);
				
				if (insert == 1) {
					num++;					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println(num);
	}
	*/
	
	
	
}























