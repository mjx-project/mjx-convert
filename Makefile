venv:
	python3 -m venv venv
	venv/bin/python3 -m pip install --upgrade pip
	venv/bin/python3 -m pip install -r requirements.txt

install:
	python3 setup.py install

cli-test:
	echo "From mjlog => mjxproto"
	cat tests_cpp/resources/mjlog/*.mjlog | mjxc convert --to-mjxproto --verbose | wc -l
	cat tests_cpp/resources/mjlog/*.mjlog | mjxc convert --to-mjxproto --compress --verbose | wc -l
	cat tests_cpp/resources/mjlog/*.mjlog | mjxc convert --to-mjxproto-raw --verbose | wc -l
	mkdir -p tests_cpp/resources/mjxproto
	mjxc convert tests_cpp/resources/mjlog tests_cpp/resources/mjxproto --to-mjxproto --verbose && cat tests_cpp/resources/mjxproto/* | wc -l
	rm -rf tests_cpp/resources/mjxproto/*.json
	mjxc convert tests_cpp/resources/mjlog tests_cpp/resources/mjxproto --to-mjxproto --compress --verbose && cat tests_cpp/resources/mjxproto/* | wc -l
	rm tests_cpp/resources/mjxproto/*.json
	mjxc convert tests_cpp/resources/mjlog tests_cpp/resources/mjxproto --to-mjxproto-raw --verbose && cat tests_cpp/resources/mjxproto/* | wc -l
	echo "From mjxproto => mjlog_recovered"
	cat tests_cpp/resources/mjxproto/*.json | mjxc convert --to-mjlog --verbose | wc -l
	mkdir -p tests_cpp/resources/mjlog_recovered
	mjxc convert tests_cpp/resources/mjxproto tests_cpp/resources/mjlog_recovered --to-mjlog --verbose && cat tests_cpp/resources/mjlog_recovered/* | wc -l
	echo "Check diff"
	python3 utils/diff.py tests_cpp/resources/mjlog tests_cpp/resources/mjlog_recovered
	echo "Clean up"
	rm -rf tests_cpp/resources/mjxproto
	rm -rf tests_cpp/resources/mjlog_recovered
	git checkout -- tests_cpp/resources


.PHONY: cli-test
