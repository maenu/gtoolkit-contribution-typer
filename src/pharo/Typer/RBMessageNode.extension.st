Extension { #name : #RBMessageNode }

{ #category : #'*Typer' }
RBMessageNode >> typTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypType'>
	| receiverType argumentTypes |
	receiverType := self typTypeForReceiver.
	argumentTypes := self typTypesForArguments.
	^ receiverType isUnion
		ifTrue: [ (((receiverType "typCastAs TypUnionType") types reject: #isNil)
				collect: [ :e | 
					TypMethodResolvers global
						typeForArgumentAt: anInteger
						ofMethod:
							(TypMethodLookup new
								receiverType: e;
								selector: self selector asSymbol;
								argumentTypes: argumentTypes;
								argumentNodes: self arguments;
								yourself) ]) typAsType ]
		ifFalse: [ TypMethodResolvers global
				typeForArgumentAt: anInteger
				ofMethod:
					(TypMethodLookup new
						receiverType: receiverType;
						selector: self selector asSymbol;
						argumentTypes: argumentTypes;
						argumentNodes: self arguments;
						yourself) ]
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForReceiver [
	<typTypeResultAs: 'TypType'>
	^ self receiver typType
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForResult [
	<typTypeResultAs: 'TypType'>
	| receiverType argumentTypes |
	receiverType := self typTypeForReceiver.
	argumentTypes := self typTypesForArguments.
	^ receiverType isUnion
		ifTrue: [ (((receiverType "typCastAs TypUnionType") types reject: #isNil)
				collect: [ :e | 
					TypMethodResolvers global
						typeForResultOfMethod:
							(TypMethodLookup new
								receiverType: e;
								selector: self selector asSymbol;
								argumentTypes: argumentTypes;
								argumentNodes: self arguments;
								yourself) ]) typAsType ]
		ifFalse: [ TypMethodResolvers global
				typeForResultOfMethod:
					(TypMethodLookup new
						receiverType: receiverType;
						selector: self selector asSymbol;
						argumentTypes: argumentTypes;
						argumentNodes: self arguments;
						yourself) ]
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeRecursive [
	^ self typTypeForResult
]

{ #category : #'*Typer' }
RBMessageNode >> typTypesForArguments [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ self arguments collect: #typType
]
