Extension { #name : #ClassDescription }

{ #category : #'*Typer-Dynamic' }
ClassDescription >> typDynAsClassInstanceVariableResolvers [
	| types |
	types := ((self classSide withAllSuperclasses flatCollect: [ :e | e class instVarNames ]) asSet collect: [ :e | e -> TypUnionType new ]) asDictionary.
	(self classSide withAllSuperclasses flatCollect: [ :e | e class methods ]) do: [ :e | e ast typDynTypesForInstanceVariables associationsDo: [ :f | (types at: f key) addAll: f value ] ].
	^ types associations
		collect: [ :e | 
			TypVariableResolver new
				receiverType: self classSide typAsType;
				selector: e key;
				type: [ e value ];
				yourself ]
]

{ #category : #'*Typer-Dynamic' }
ClassDescription >> typDynAsClassVariableResolvers [
	| types |
	types := ((self instanceSide withAllSuperclasses flatCollect: [ :e | e classVarNames ]) asSet collect: [ :e | e -> TypUnionType new ]) asDictionary.
	((self instanceSide withAllSuperclasses flatCollect: #methods) , (self classSide withAllSuperclasses flatCollect: #methods)) asSet do: [ :e | e ast typDynTypesForClassVariables associationsDo: [ :f | (types at: f key) addAll: f value ] ].
	^ types associations
		collect: [ :e | 
			TypVariableResolver new
				receiverType: self classSide typAsType;
				selector: e key;
				type: [ e value ];
				yourself ]
]

{ #category : #'*Typer-Dynamic' }
ClassDescription >> typDynAsInstanceVariableResolvers [
	| types |
	types := ((self instanceSide withAllSuperclasses flatCollect: [ :e | e instVarNames ]) asSet collect: [ :e | e -> TypUnionType new ]) asDictionary.
	(self instanceSide withAllSuperclasses flatCollect: #methods) do: [ :e | e ast typDynTypesForInstanceVariables associationsDo: [ :f | (types at: f key) addAll: f value ] ].
	^ types associations
		collect: [ :e | 
			TypVariableResolver new
				receiverType: self instanceSide typAsType;
				selector: e key;
				type: [ e value ];
				yourself ]
]

{ #category : #'*Typer-Dynamic' }
ClassDescription >> typDynAsPoolVariableResolvers [
	| types |
	types := ((self instanceSide withAllSuperclasses flatCollect: [ :e | e allSharedPools collect: [ :f | f classVarNames ] ]) asSet collect: [ :e | e -> TypUnionType new ]) asDictionary.
	((self instanceSide withAllSuperclasses flatCollect: #methods) , (self classSide withAllSuperclasses flatCollect: #methods)) asSet do: [ :e | e ast typDynTypesForPoolVariables associationsDo: [ :f | (types at: f key) addAll: f value ] ].
	^ types associations
		collect: [ :e | 
			TypVariableResolver new
				receiverType: self typAsType;
				selector: e key;
				type: [ e value ];
				yourself ]
]
