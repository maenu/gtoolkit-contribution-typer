Extension { #name : #ClassDescription }

{ #category : #'*Typer-Dynamic' }
ClassDescription >> typDynAsVariableResolvers [
	^ self typDynAsVariableResolversWithDiscovered: Set new
]

{ #category : #'*Typer-Dynamic' }
ClassDescription >> typDynAsVariableResolversWithDiscovered: aSet [
	| types |
	types := ((self withAllSuperclasses flatCollect: [ :e | e instVarNames ]) asSet collect: [ :e | e -> TypDynTypes new ]) asDictionary.
	(self withAllSuperclasses flatCollect: #methods)
		do: [ :e | e ast typDynTypesForInstanceVariables associationsDo: [ :f | (types at: f key) addAll: f value ] ].
	^ types associations
		collect: [ :e | 
			TypVariableResolver new
				variableType: self typAsType;
				variableSelector: e key;
				typType: e value asType;
				yourself ]
]
