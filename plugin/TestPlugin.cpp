#include "TestPlugin.h"
#include "util/Logger.h"

void TestPlugin::load_to(sol::table &table)
{
	table.set_function("hello_plugin", []{
		logger->info("Hello from C++ plugin!");
	}
	);

}

TestPlugin::TestPlugin()
{

}
