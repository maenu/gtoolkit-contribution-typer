Class {
	#name : #TypDynCollector,
	#superclass : #Object,
	#instVars : [
		'asts'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Dynamic'
}

{ #category : #accessing }
TypDynCollector >> collectIn: aCollection doing: aBlock [
	<typTypeArgument: 1 as: 'Collection<CompiledMethod()->Object>'>
	<typTypeArgument: 2 as: 'BlockClosure()->Object'>
	<typTypeResultAs: 'Association<Association<Object,TypDynResolver<TypLookup>>,TypDynResolver<TypLookup>>'>
	| methodResults variableTypes result |
	result := nil "typCastAs {!,Object}".
	methodResults := Dictionary new "typParameters Association<ClassDescription,Symbol>,TypMethodResolver<TypMethodLookup>".
	variableTypes := Dictionary new "typParameters Association<ClassDescription,Symbol>,TypVariableResolver<TypVariableLookup>".
	asts := aCollection collect: [ :e | e ast
		doSemanticAnalysis;
		typInfTypeReset;
		typDynInstall ].
	[ result := aBlock value.
	methodResults := self collectMethodResultsIn: asts.
	variableTypes := self collectVariableTypesIn: asts ]
		ensure: [ "asts do: #typDynUninstall" ].
	^ result
		->
			(TypDynLookupResolver new
				results: methodResults;
				yourself)
		->
			(TypDynLookupResolver new
				results: variableTypes;
				yourself)
]

{ #category : #accessing }
TypDynCollector >> collectIn: aCollection running: someTestCases [
	<typTypeArgument: 1 as: 'Collection<CompiledMethod()->Object>'>
	<typTypeArgument: 2 as: 'Collection<TestCase class>'>
	<typTypeResultAs:
		'Association<Association<Object,TypDynResolver<TypLookup>>,TypDynResolver<TypLookup>>'>
	| methodResults variableTypes result |
	result := TestResult new.
	methodResults := Dictionary new.	"typParameters Association<ClassDescription,Symbol>,TypMethodResolver<TypMethodLookup>"
	variableTypes := Dictionary new.	"typParameters Association<ClassDescription,Symbol>,TypVariableResolver<TypVariableLookup>"
	asts := aCollection
		collect: [ :e | 
			e ast
				doSemanticAnalysis;
				typInfTypeReset;
				typDynInstall ].
	TestCase class announcer when: TestCaseEnded send: #stash to: self.
	[ someTestCases
		do: [ :e"typCastAs TestCase class"
			 | e suite run: result ]
		displayingProgress: 'Running test case'.
	methodResults := self collectMethodResultsIn: asts.
	variableTypes := self collectVariableTypesIn: asts ]
		ensure: [ TestCase class announcer unsubscribe: self.
			asts do: #typDynUninstall.
			asts := nil ].
	^ result
		->
			(TypDynLookupResolver new
				results: methodResults;
				yourself)
		->
			(TypDynLookupResolver new
				results: variableTypes;
				yourself)
]

{ #category : #accessing }
TypDynCollector >> collectMethodResultsIn: aCollection [
	<typTypeArgument: 1 as: 'Collection<RBMethodNode>'>
	<typTypeResultAs:
		'Dictionary<Association<ClassDescription,Symbol>,TypMethodLookupResult>'>
	^ ((aCollection
		collect: [ :e | e methodClass -> e selector -> e typDynAsMethodLookupResult ])
		reject: [ :e | e value isNil ]) asDictionary
]

{ #category : #accessing }
TypDynCollector >> collectVariableTypesIn: aCollection [
	<typTypeArgument: 1 as: 'Collection<RBMethodNode>'>
	<typTypeResultAs:
		'Dictionary<Association<ClassDescription,Symbol>,TypType>'>
	^ ((aCollection
		flatCollect: [ :e | e typDynTypesForVariables associations ])
		groupedBy: #key)
		collect: [ :e | 
			((e collect: #value)
				inject: TypDynUnionType new
				into: [ :a :b | a , b ]) asNonDynType ]
]

{ #category : #'as yet unclassified' }
TypDynCollector >> stash [
	asts do: #typDynStash
]
