Extension { #name : #Semaphore }

{ #category : #'*Typer-Shadow-Pharo' }
Semaphore >> typShaMetSignal: aLookup [
	<typShaMethod: 'signal'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup root self
]

{ #category : #'*Typer-Shadow-Pharo' }
Semaphore >> typShaMetWait: aLookup [
	<typShaMethod: 'wait'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup root self
]
