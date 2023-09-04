Extension { #name : #BlParabollaArcElement }

{ #category : #'*Typer-GToolkit' }
BlParabollaArcElement >> typGtOpacity: aNumber [
	| edge |
	edge := self userData at: #typGtEdge.
	self border: (edge typGtBorder: aNumber).
	toHead
		border: (edge typGtBorder: aNumber);
		background: (edge typGtBackground: aNumber)
]
