Extension { #name : #Semaphore }

{ #category : #'*Typer-Shadow-Pharo' }
Semaphore >> typShaMethodUnarySignal: aLookup root: anotherLookup [
	<typShaMethod: 'signal'>
	^ CompiledMethod typAsFunctionTypeWithResult: anotherLookup self
]

{ #category : #'*Typer-Shadow-Pharo' }
Semaphore >> typShaMethodUnaryWait: aLookup root: anotherLookup [
	<typShaMethod: 'wait'>
	^ CompiledMethod typAsFunctionTypeWithResult: anotherLookup self
]
