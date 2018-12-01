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
	[ result := aBlock value ]
		ensure: [ methodResolvers addAll: (asts collect: #typDynAsMethodResolver).
			variableResolvers
				addAll:
					((asts collect: [ :e | e method methodClass ]) asSet
						flatCollect:
							[ :e | e typDynAsInstanceVariableResolvers , e typDynAsClassInstanceVariableResolvers , e typDynAsClassVariableResolvers , e typDynAsPoolVariableResolvers ]).
			asts do: #typDynUninstall ].
	^ result
		->
			(TypMethodResolvers new
				resolvers: methodResolvers;
				yourself)
		->
			(TypVariableResolvers new
				resolvers: variableResolvers;
				yourself)
]
