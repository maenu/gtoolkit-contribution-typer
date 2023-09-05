Class {
	#name : #TypGtCursorStyler,
	#superclass : #TypGtValueStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #visiting }
TypGtCursorStyler >> styleNode: aNode [
	<typPraArguments: 'RBValueNode'>
	| nodes |
	nodes := self context nodesAt: aNode.
	self
		attributes: {TypGtCursorAttribute new
					coder: self coderViewModel;
					node: aNode;
					attribute: (TypGtAttribute nodes: nodes)}
		from: aNode start
		to: aNode stop
]
