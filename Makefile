run_all_in_parallel:
	make -j test_Windows_10_edge_86 test_OX_X_10_11_firefox_59 test_Windows_10_chrome_85

test_Windows_10_edge_86:
	robot  --variable platform:"Windows 10" --variable browserName:MicrosoftEdge --variable version:86.0 --variable ROBOT_BROWSER:chrome --variable visual:false --variable network:false --variable console:false Tests/sample_todo.robot

test_OX_X_10_11_firefox_59:
	robot --variable platform:"macOS Sierra" --variable browserName:firefox --variable version:59.0 --variable ROBOT_BROWSER:firefox --variable visual:false --variable network:false --variable console:false Tests/sample_todo.robot

test_Windows_10_chrome_85:
	robot --variable platform:"Windows 10" --variable browserName:chrome --variable version:85.0 --variable ROBOT_BROWSER:chrome --variable visual:false --variable network:false --variable console:false Tests/sample_todo.robot

test_OX_X_10_11_firefox_59_action-chains:
	robot --variable platform:"macOS Sierra" --variable browserName:firefox --variable version:59.0 --variable ROBOT_BROWSER:firefox --variable visual:true --variable network:true --variable console:true Tests/action-chains.robot

