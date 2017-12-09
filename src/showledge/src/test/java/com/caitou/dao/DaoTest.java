package com.caitou.dao;

/*@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration({"classpath:applicationContext.xml"})  */
public class DaoTest {
	/*
	@Autowired
	private DynamicDao dynamicDao; 
	
	@Autowired
	private IEssayDao iEssayDao; 
	
	*//**
	 * 测试数据库是否能够连接成功
	 * @throws Exception
	 *//*
	@Test
	public void testDyn (){
		List<Dynamic> select = dynamicDao.select(null);
		System.out.println(select.size());
	}
	
	@Test
	public void testEssay(){
		//iEssayDao.selectByPrimaryKey(key);
	}
	
	@Autowired
	private EssayService essayService;
	@Autowired
	private EssayTypeService essayTypeService;

	@Test
	public void testData(){
		//获取所有分类
		List<EssayType> select = essayTypeService.select(null);
		select.add(0, new EssayType(0, "全部"));

		//新主页数据
		HashMap<String,HashMap<String,PageInfo<?>>> newIndexData = essayService.getNewIndexData(select);
		
		HashMap<String,PageInfo<?>> hashMap = newIndexData.get("0");
		//List<?> list = hashMap.get("dyn").getList();
		//System.out.println(list.size());
	}
	

	
	@Autowired
	private IFamousDao famousDao;
	
	@Test
	public void testLimit(){
		
		PageHelper.startPage(1, 3);
		List<Essay> selectFamousByType = famousDao.selectFamousByType(1);
		if (selectFamousByType instanceof Page) {
			System.out.println("代理过了");
		}
		PageInfo<Essay> page = new PageInfo<>(selectFamousByType);
		System.out.println(selectFamousByType.size());
		System.out.println(page.getList().size());
		System.out.println(page.getTotal());
	}
	

	@Test
	public void testDAaa(){
		//获取所有分类
		List<EssayType> select = essayTypeService.select(null);
		select.add(0, new EssayType(0, "全部"));

		List<DataBean<EssayType,PageInfo<Essay>>> hotNote = essayService.getHotNote(select);
		
		for (DataBean<EssayType, PageInfo<Essay>> dataBean : hotNote) {
			System.out.println(dataBean.getT().getName());
			
			List<Essay> list = dataBean.getE().getList();
			long total = dataBean.getE().getTotal();
			System.out.println(list.size());
			System.out.println(total);
			for (Essay essay : list) {
				System.out.println(essay.getEssayTitle());
			}
			System.out.println();
		}
		
	}
	
	
	@Autowired
	private IUserDao userDao;
	
	@Test
	public void testFollow(){
		List<User> banYan = userDao.getBanYan(1);
		System.out.println(banYan.size());
		System.err.println(banYan.get(0));
	}
	
	
	@Test
	public void testF(){
		
		List<Essay> followEssay = iEssayDao.getFollowEssay(1);
		System.out.println(followEssay.size());
	}

	
	@Autowired
	private DynamicService dynamicService;

	@Test
	public void testP(){
		dynamicService.publishDyn("123", "11","32", "1231");
	}
	
	@Test
	public void skldjf(){
		List<Essay> essayByUserIdOrderByTime = essayService.getEssayByUserIdOrderByTime(Integer.valueOf("195101"));
		System.out.println(essayByUserIdOrderByTime.size());
	}
	
	*/
}





























