Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodUnaryArguments: aLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBValueNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodUnaryKeywordsIntervals: aLookup [
	<typShaMethod: 'keywordsIntervals'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType
				withParameters: {Interval typAsType withParameters: {Integer typAsType}})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodUnaryNumArgs: aLookup [
	<typShaMethod: 'numArgs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodUnaryReceiver: aLookup [
	<typShaMethod: 'receiver'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBValueNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodUnarySelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
