Class {
	#name : #TypDynCollector,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Dynamic-Core'
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
		ensure: [ asts do: #typDynUninstall ].
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
