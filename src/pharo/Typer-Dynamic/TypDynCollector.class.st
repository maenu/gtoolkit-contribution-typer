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
	<typTypeArgument: 1 as: 'Collection<CompiledMethod<Integer>>'>
	<typTypeArgument: 2 as: 'BlockClosure()->Object'>
	<typTypeResultAs: 'Association<Association<Object,TypDynResolver<TypLookup>>,TypDynResolver<TypLookup>>'>
	| methodResults variableResults result asts |
	result := nil "typCastAs !Object".
	methodResults := Dictionary new "typParameters Association<ClassDescription,Symbol<Character>>,TypMethodResolver<TypMethodLookup>".
	variableResults := Dictionary new "typParameters Association<ClassDescription,Symbol<Character>>,TypVariableResolver<TypVariableLookup>".
	asts := aCollection collect: [ :e | e ast
		doSemanticAnalysis;
		typTypeReset;
		typDynInstall ].
	[ result := aBlock value.
	methodResults := self collectMethodResultsIn: asts.
	variableResults := self collectVariableResultsIn: asts ]
		ensure: [ "asts do: #typDynUninstall" ].
	^ result
		->
			(TypDynLookupResolver new
				results: methodResults;
				yourself)
		->
			(TypDynLookupResolver new
				results: variableResults;
				yourself)
]

{ #category : #accessing }
TypDynCollector >> collectIn: aCollection running: someTestCases [
	<typTypeArgument: 1 as: 'Collection<CompiledMethod<Integer>>'>
	<typTypeArgument: 2 as: 'Collection<TestCase class>'>
	<typTypeResultAs:
		'Association<Association<Object,TypDynResolver<TypLookup>>,TypDynResolver<TypLookup>>'>
	| methodResults variableResults result |
	result := TestResult new.
	methodResults := Dictionary new.	"typParameters Association<ClassDescription,Symbol<Character>>,TypMethodResolver<TypMethodLookup>"
	variableResults := Dictionary new.	"typParameters Association<ClassDescription,Symbol<Character>>,TypVariableResolver<TypVariableLookup>"
	asts := aCollection
		collect: [ :e | 
			e ast
				doSemanticAnalysis;
				typTypeReset;
				typDynInstall ].
	TestCase class announcer when: TestCaseEnded send: #stash to: self.
	[ someTestCases
		do: [ :e"typCastAs TestCase class"
			 | e suite run: result ]
		displayingProgress: 'Running test case'.
	methodResults := self collectMethodResultsIn: asts.
	variableResults := self collectVariableResultsIn: asts ]
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
				results: variableResults;
				yourself)
]

{ #category : #accessing }
TypDynCollector >> collectMethodResultsIn: aCollection [
	<typTypeArgument: 1 as: 'Collection<RBMethodNode>'>
	<typTypeResultAs:
		'Dictionary<Association<ClassDescription,Symbol<Character>>,TypMethodLookupResult>'>
	^ ((aCollection
		collect: [ :e | e methodClass -> e selector -> e typDynAsMethodLookupResult ])
		reject: [ :e | e value isNil ]) asDictionary
]

{ #category : #accessing }
TypDynCollector >> collectVariableResultsIn: aCollection [
	<typTypeArgument: 1 as: 'Collection<RBMethodNode>'>
	<typTypeResultAs:
		'Dictionary<Association<ClassDescription,Symbol<Character>>,TypVariableLookupResult>'>
	^ (((aCollection
		flatCollect: [ :e | e typDynTypesForVariables associations ])
		groupedBy: #key)
		collect: [ :e | 
			| type |
			type := ((e collect: #value)
				inject: TypDynUnionType new
				into: [ :a :b | a , b ]) asNonDynType.
			type isUnknown
				ifTrue: [ nil ]
				ifFalse: [ TypVariableLookupResult new
						type: [ type ];
						yourself ] ]) reject: [ :e | e value isNil ]
]

{ #category : #'as yet unclassified' }
TypDynCollector >> stash [
	asts do: #typDynStash
]
