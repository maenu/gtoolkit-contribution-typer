Extension { #name : #TypEdge }

{ #category : #'*Typer-GToolkit' }
TypEdge >> gtDataFor: aView [

	<gtView>
	^ aView explicit
		  title: 'Data';
		  priority: 10;
		  stencil: [ GtInspectorTool forObject: data ]
]

{ #category : #'*Typer-GToolkit' }
TypEdge >> gtGraphFor: aView [

	<gtView>
	^ aView typGtMondrian
		  title: 'Graph';
		  priority: 10;
		  painting: [ :m | 
			  m nodes
				  stencil: [ :e | e asElementIn: m ];
				  with: { 
						  origin.
						  target }.
			  m edges
				  stencil: [ :e | e asElementIn: m ];
				  connect: { self } from: #origin to: #target.
			  m layout custom: TypGtGraphForceBasedLayout new.
			  m ]
]
