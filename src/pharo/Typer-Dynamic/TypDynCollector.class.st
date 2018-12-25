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
	<typTypeArgument: 2 as: 'BlockClosure()->?'>
	<typTypeResultAs: 'Association<Association<?,TypDynResolver<TypLookup>>,TypDynResolver<TypLookup>>'>
	| methodResolvers variableResolvers result asts |
	methodResolvers := Dictionary new "typParameters Association<ClassDescription,Symbol<Character>>,TypMethodResolver<TypMethodLookup>".
	variableResolvers := Dictionary new "typParameters Association<ClassDescription,Symbol<Character>>,TypVariableResolver<TypVariableLookup>".
	result := nil.
	asts := aCollection collect: [ :e | e ast typDynInstall ].
	[ result := aBlock value.
	methodResolvers := self collectMethodResolversIn: asts.
	variableResolvers := self collectVariableResolversIn: asts ]
		ensure: [ asts do: #typDynUninstall ].
	^ result
		->
			(TypDynResolver new
				resolvers: methodResolvers;
				yourself)
		->
			(TypDynResolver new
				resolvers: variableResolvers;
				yourself)
]

{ #category : #accessing }
TypDynCollector >> collectMethodResolversIn: aCollection [
	<typTypeArgument: 1 as: 'Collection<RBMethodNode>'>
	<typTypeResultAs:
		'Dictionary<Association<ClassDescription,Symbol<Character>>,TypMethodResolver<TypMethodLookup>>'>
	^ (aCollection
		collect: [ :e | e methodClass -> e selector -> e typDynAsMethodResolver ])
		asDictionary
]

{ #category : #accessing }
TypDynCollector >> collectVariableResolversIn: aCollection [
	<typTypeArgument: 1 as: 'Collection<RBMethodNode>'>
	<typTypeResultAs:
		'Dictionary<Association<ClassDescription,Symbol<Character>>,TypVariableResolver<TypVariableLookup>>'>
	^ ((aCollection
		flatCollect: [ :e | e typDynTypesForVariables associations ])
		groupedBy: #key)
		collect: [ :e | 
			| type |
			type := (e collect: #value)
				inject: TypDynUnionType new
				into: [ :a :b | a , b ].
			TypVariableResolver new
				type: [ type ];
				yourself ]
]
