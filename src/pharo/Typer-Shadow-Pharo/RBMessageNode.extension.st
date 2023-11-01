Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodUnaryArguments: aLookup root: anotherLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBValueNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodUnaryKeywordsIntervals: aLookup root: anotherLookup [
	<typShaMethod: 'keywordsIntervals'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType
				withParameters: {Interval typAsType withParameters: {Integer typAsType}})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodUnaryNumArgs: aLookup root: anotherLookup [
	<typShaMethod: 'numArgs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodUnaryReceiver: aLookup root: anotherLookup [
	<typShaMethod: 'receiver'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBValueNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodUnarySelector: aLookup root: anotherLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
