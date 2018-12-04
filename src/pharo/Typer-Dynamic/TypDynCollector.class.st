Class {
	#name : #TypDynCollector,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #'as yet unclassified' }
TypDynCollector >> collectIn: aCollection doing: aBlock [
	| methodResolvers variableResolvers result asts |
	methodResolvers := OrderedCollection new.
	variableResolvers := OrderedCollection new.
	result := nil.
	asts := aCollection collect: [ :e | e ast typDynInstall ].
	[ result := aBlock value.
	methodResolvers := self collectMethodResolversIn: aCollection.
	variableResolvers := self collectVariableResolversIn: aCollection ]
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

{ #category : #'as yet unclassified' }
TypDynCollector >> collectMethodResolversIn: aCollection [
	^ (aCollection collect: [ :e | e methodClass -> e selector -> e typDynAsMethodResolver ]) asDictionary
]

{ #category : #'as yet unclassified' }
TypDynCollector >> collectVariableResolversIn: aCollection [
	^ ((aCollection flatCollect: [ :e | e typDynTypesForVariables associations ]) groupedBy: #key)
		collect: [ :e | 
			| type |
			type := e value inject: TypUnionType new into: [ :a :b | a , b ].
			TypVariableResolver new
				type: [ type ];
				yourself ]
]
