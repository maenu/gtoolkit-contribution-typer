Extension { #name : #Semaphore }

{ #category : #'*Typer-Shadow-Pharo' }
Semaphore >> typShaMethodUnarySignal: aLookup [
	<typShaMethod: 'signal'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup root self
]

{ #category : #'*Typer-Shadow-Pharo' }
Semaphore >> typShaMethodUnaryWait: aLookup [
	<typShaMethod: 'wait'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup root self
]
