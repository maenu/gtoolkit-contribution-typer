Extension { #name : #RBMessageNode }

{ #category : #'*Typer' }
RBMessageNode >> typTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypType'>
	| receiverType |
	receiverType := self typTypeForReceiver.
	^ TypMethodResolvers global
		typeForArgumentAt: anInteger
		ofMethod:
			(TypMethodLookup new
				receiverType: receiverType;
				selector: self selector asSymbol;
				argumentTypes: self typTypesForArguments;
				yourself)
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForReceiver [
	<typTypeResultAs: 'TypType'>
	^ self receiver typType
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForResult [
	<typTypeResultAs: 'TypType'>
	| receiverType |
	receiverType := self typTypeForReceiver.
	^ TypMethodResolvers global
		typeForResultOfMethod:
			(TypMethodLookup new
				receiverType: receiverType;
				selector: self selector asSymbol;
				argumentTypes: (self typTypesForArguments);
				yourself)
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeRecursive [
	^ self typTypeForResult
]

{ #category : #'*Typer' }
RBMessageNode >> typTypesForArguments [
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	^ self arguments collect: #typType
]
