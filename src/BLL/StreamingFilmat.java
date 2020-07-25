/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Arbesa
 */
@Entity
@Table(name = "Streaming_Filmat")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StreamingFilmat.findAll", query = "SELECT s FROM StreamingFilmat s"),
    @NamedQuery(name = "StreamingFilmat.findByStreamingFilmID", query = "SELECT s FROM StreamingFilmat s WHERE s.streamingFilmID = :streamingFilmID"),
    @NamedQuery(name = "StreamingFilmat.findByCmimi", query = "SELECT s FROM StreamingFilmat s WHERE s.cmimi = :cmimi"),
    @NamedQuery(name = "StreamingFilmat.findByDataFilmit", query = "SELECT s FROM StreamingFilmat s WHERE s.dataFilmit = :dataFilmit"),
    @NamedQuery(name = "StreamingFilmat.findByOraFillimit", query = "SELECT s FROM StreamingFilmat s WHERE s.oraFillimit = :oraFillimit"),
    @NamedQuery(name = "StreamingFilmat.findByOraMbarimit", query = "SELECT s FROM StreamingFilmat s WHERE s.oraMbarimit = :oraMbarimit")})
public class StreamingFilmat implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "StreamingFilmID")
     @GeneratedValue(generator = "InvSeq")
    @SequenceGenerator(name = "InvSeq" , sequenceName = "INV_SEQ", allocationSize = 1)
    private Integer streamingFilmID;
    @Column(name = "Cmimi")
    private Long cmimi;
    @Column(name = "DataFilmit")
    @Temporal(TemporalType.DATE)
    private Date dataFilmit;
    @Column(name = "OraFillimit")
    @Temporal(TemporalType.TIME)
    private Date oraFillimit;
    @Column(name = "OraMbarimit")
    @Temporal(TemporalType.TIME)
    private Date oraMbarimit;
    @OneToMany(mappedBy = "streamingFilmID")
    private Collection<Bileta> biletaCollection;
    @JoinColumn(name = "FilmiID", referencedColumnName = "FilmiID")
    @ManyToOne
    private Filmi filmiID;

    public StreamingFilmat() {
    }

    public StreamingFilmat(Integer streamingFilmID) {
        this.streamingFilmID = streamingFilmID;
    }

    public Integer getStreamingFilmID() {
        return streamingFilmID;
    }

    public void setStreamingFilmID(Integer streamingFilmID) {
        this.streamingFilmID = streamingFilmID;
    }

    public Long getCmimi() {
        return cmimi;
    }

    public void setCmimi(Long cmimi) {
        this.cmimi = cmimi;
    }

    public Date getDataFilmit() {
        return dataFilmit;
    }

    public void setDataFilmit(Date dataFilmit) {
        this.dataFilmit = dataFilmit;
    }

    public Date getOraFillimit() {
        return oraFillimit;
    }

    public void setOraFillimit(Date oraFillimit) {
        this.oraFillimit = oraFillimit;
    }

    public Date getOraMbarimit() {
        return oraMbarimit;
    }

    public void setOraMbarimit(Date oraMbarimit) {
        this.oraMbarimit = oraMbarimit;
    }

    @XmlTransient
    public Collection<Bileta> getBiletaCollection() {
        return biletaCollection;
    }

    public void setBiletaCollection(Collection<Bileta> biletaCollection) {
        this.biletaCollection = biletaCollection;
    }

    public Filmi getFilmiID() {
        return filmiID;
    }

    public void setFilmiID(Filmi filmiID) {
        this.filmiID = filmiID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (streamingFilmID != null ? streamingFilmID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StreamingFilmat)) {
            return false;
        }
        StreamingFilmat other = (StreamingFilmat) object;
        if ((this.streamingFilmID == null && other.streamingFilmID != null) || (this.streamingFilmID != null && !this.streamingFilmID.equals(other.streamingFilmID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BLL.StreamingFilmat[ streamingFilmID=" + streamingFilmID + " ]";
    }
    
}
