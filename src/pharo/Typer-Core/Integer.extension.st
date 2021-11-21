Extension { #name : 'Integer' }

{ #category : '*Typer-Core' }
Integer >> typTimesCollect: aBlock [

	^ (1 to: self) collect: aBlock
]
