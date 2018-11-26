Extension { #name : #ClassDescription }

{ #category : #'*Typer-Dynamic' }
ClassDescription >> typDynAsClassInstanceVariableResolvers [
	| types |
	types := ((self withAllSuperclasses flatCollect: [ :e | e class instVarNames ]) asSet collect: [ :e | e -> TypUnionType new ]) asDictionary.
	(self withAllSuperclasses flatCollect: [ :e | e class methods ]) do: [ :e | e ast typDynTypesForInstanceVariables associationsDo: [ :f | (types at: f key) addAll: f value ] ].
	^ types associations
		collect: [ :e | 
			TypVariableResolver new
				variableType: self typAsType;
				variableSelector: e key;
				typType: e value;
				yourself ]
]

{ #category : #'*Typer-Dynamic' }
ClassDescription >> typDynAsClassVariableResolvers [
	| types |
	types := ((self withAllSuperclasses flatCollect: [ :e | e classVarNames ]) asSet collect: [ :e | e -> TypUnionType new ]) asDictionary.
	((self withAllSuperclasses flatCollect: #methods) , (self class withAllSuperclasses flatCollect: #methods)) asSet do: [ :e | e ast typDynTypesForClassVariables associationsDo: [ :f | (types at: f key) addAll: f value ] ].
	^ types associations
		collect: [ :e | 
			TypVariableResolver new
				variableType: self typAsType;
				variableSelector: e key;
				typType: e value;
				yourself ]
]

{ #category : #'*Typer-Dynamic' }
ClassDescription >> typDynAsInstanceVariableResolvers [
	| types |
	types := ((self withAllSuperclasses flatCollect: [ :e | e instVarNames ]) asSet collect: [ :e | e -> TypUnionType new ]) asDictionary.
	(self withAllSuperclasses flatCollect: #methods) do: [ :e | e ast typDynTypesForInstanceVariables associationsDo: [ :f | (types at: f key) addAll: f value ] ].
	^ types associations
		collect: [ :e | 
			TypVariableResolver new
				variableType: self typAsType;
				variableSelector: e key;
				typType: e value;
				yourself ]
]

{ #category : #'*Typer-Dynamic' }
ClassDescription >> typDynAsPoolVariableResolvers [
	| types |
	types := ((self withAllSuperclasses flatCollect: [ :e | e allSharedPools collect: [ :f | f classVarNames ] ]) asSet collect: [ :e | e -> TypUnionType new ]) asDictionary.
	((self withAllSuperclasses flatCollect: #methods) , (self class withAllSuperclasses flatCollect: #methods)) asSet do: [ :e | e ast typDynTypesForPoolVariables associationsDo: [ :f | (types at: f key) addAll: f value ] ].
	^ types associations
		collect: [ :e | 
			TypVariableResolver new
				variableType: self typAsType;
				variableSelector: e key;
				typType: e value;
				yourself ]
]
