Class {
	#name : #TypGtMethodCommentBodyStyler,
	#superclass : #GtCoderBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtMethodCommentBodyStyler >> styleComment: aComment [
	<typTypeArgument: 1 as: 'RBComment'>
	self flag: 'does not store yet'.
	self
		styleFrom: aComment start
		to: aComment stop
		with:
			{(BrTextAdornmentDynamicAttribute new
				beAppend;
				stencil: [ self flag: 'replacing replaces multiple times'.
					(Gt2Document new
						strategy: Gt2NoStorageStrategy uniqueInstance;
						text:
							(aComment contents
								ifEmpty: [ 'what does this method do?' ]
								ifNotEmpty: #yourself);
						read;
						asElement)
						constraintsDo: [ :c | 
									c horizontal matchParent.
									c vertical exact: 200 ];
						yourself ]).
			(TypGtCheckErrorAttribute new
				text: 'does not store yet';
				yourself)}
]

{ #category : #visiting }
TypGtMethodCommentBodyStyler >> visitMethodNode: aNode [
	super visitMethodNode: aNode.
	aNode comments do: [ :e | self styleComment: e ]
]
