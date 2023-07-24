Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodArguments: aLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBValueNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodKeywordsIntervals: aLookup [
	<typShaMethod: 'keywordsIntervals'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType
				withParameters: {Interval typAsType withParameters: {Integer typAsType}})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodNumArgs: aLookup [
	<typShaMethod: 'numArgs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodReceiver: aLookup [
	<typShaMethod: 'receiver'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBValueNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMessageNode >> typShaMethodSelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
